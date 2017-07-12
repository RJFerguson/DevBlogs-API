Rails.application.config.middleware.use OmniAuth::Builder do
  provider :github, "bd4972acb40267744c5f", "305960e548460f6dc995744d317e9eb72dae14f3", scope: "user:email,user:follow"
end