defmodule ProletarianSolidarity.Bot.ApiClient do
  @callback send_msg(String.t(), integer(), String.t()) :: any()
  @callback get_token() :: any()
end

defmodule ProletarianSolidarity.Bot.API do
  @behaviour ProletarianSolidarity.Bot.ApiClient

  def get_token(), do: Application.get_env(:proletarian_solidarity, :token)

  def send_msg(token, chat_id, text) do
    Telegram.Api.request(token, "sendMessage",
      chat_id: chat_id,
      text: text
    )
  end
end
