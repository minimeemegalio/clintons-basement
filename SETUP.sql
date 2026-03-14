-- Run this in your Supabase SQL editor to enable the global leaderboard
-- supabase.com → your project → SQL Editor → paste this → Run

create table leaderboard (
  id serial primary key,
  name text not null,
  score integer not null,
  level integer not null,
  created_at timestamp default now()
);

-- Allow anyone to read and submit scores (public game)
alter table leaderboard enable row level security;
create policy "Anyone can read scores"  on leaderboard for select using (true);
create policy "Anyone can submit score" on leaderboard for insert with check (true);
