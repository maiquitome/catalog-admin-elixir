defmodule MicroVideos.Repo do
  use Ecto.Repo,
    otp_app: :micro_videos,
    adapter: Ecto.Adapters.Postgres
end
