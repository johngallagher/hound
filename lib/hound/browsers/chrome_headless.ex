defmodule Hound.Browser.ChromeHeadless do
  @moduledoc false

  @behaviour Hound.Browser

  def default_user_agent, do: :chrome

  def default_capabilities(ua) do
    %{chromeOptions: Map.merge(chrome_binary(), %{"args" => ["--user-agent=#{ua}", "--headless", "--disable-gpu"]}) }
  end

  def chrome_binary do
    case System.get_env("GOOGLE_CHROME_SHIM") do
      nil -> %{}
      path -> %{ "binary" => path }
    end
  end
end
