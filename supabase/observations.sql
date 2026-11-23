create table if not exists public.observations (
  id bigint generated always as identity primary key,
  name text not null check (char_length(name) between 1 and 20),
  text text not null check (char_length(text) between 1 and 280),
  created_at timestamptz not null default now()
);

alter table public.observations enable row level security;

grant usage on schema public to anon, authenticated;
grant select, insert on table public.observations to anon, authenticated;
grant usage, select on sequence public.observations_id_seq to anon, authenticated;

drop policy if exists "alle duerfen beobachtungen lesen" on public.observations;
create policy "alle duerfen beobachtungen lesen"
  on public.observations for select
  to anon, authenticated
  using (true);

drop policy if exists "alle duerfen beobachtungen schreiben" on public.observations;
create policy "alle duerfen beobachtungen schreiben"
  on public.observations for insert
  to anon, authenticated
  with check (true);
