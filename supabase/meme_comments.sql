create table meme_comments (
  id bigint generated always as identity primary key,
  day date not null,
  name text not null check (char_length(name) between 1 and 20),
  text text not null check (char_length(text) between 1 and 140),
  created_at timestamptz not null default now()
);

alter table meme_comments enable row level security;

create policy "alle duerfen lesen"
  on meme_comments for select
  using (true);

create policy "alle duerfen schreiben"
  on meme_comments for insert
  with check (true);
