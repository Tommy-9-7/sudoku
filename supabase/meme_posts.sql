create table if not exists meme_posts (
  id bigint generated always as identity primary key,
  name text not null check (char_length(name) between 1 and 20),
  image_url text not null,
  created_at timestamptz not null default now()
);

alter table meme_posts enable row level security;

drop policy if exists "alle duerfen memes lesen" on meme_posts;
create policy "alle duerfen memes lesen"
  on meme_posts for select
  using (true);

drop policy if exists "alle duerfen memes schreiben" on meme_posts;
create policy "alle duerfen memes schreiben"
  on meme_posts for insert
  with check (true);

insert into storage.buckets (id, name, public)
values ('memes', 'memes', true)
on conflict (id) do update set public = true;

drop policy if exists "memes oeffentlich lesen" on storage.objects;
create policy "memes oeffentlich lesen"
  on storage.objects for select
  using (bucket_id = 'memes');

drop policy if exists "alle duerfen memes hochladen" on storage.objects;
create policy "alle duerfen memes hochladen"
  on storage.objects for insert
  with check (bucket_id = 'memes');
