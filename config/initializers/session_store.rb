CastAuth::Application.config.session_store(
  :cookie_store,
  key: '_cast_user_session',
  expire_after: 60.seconds
)
