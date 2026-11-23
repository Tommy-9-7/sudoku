create table runner_scores (
  id bigint generated always as identity primary key,
  name text not null check (char_length(name) between 1 and 20),
  score integer not null check (score between 0 and 100000),
  created_at timestamptz not null default now()
);

alter table runner_scores enable row level security;

create policy "alle duerfen lesen"
  on runner_scores for select
  using (true);

create policy "alle duerfen schreiben"
  on runner_scores for insert
  with check (true);
