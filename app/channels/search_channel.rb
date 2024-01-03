class SearchChannel < ApplicationCable::Channel
  def subscribed
    stream_from "search_channel"
  end

  def receive(data)
    search_query = data['search_query']

    ActionCable.server.broadcast('search_channel', search_query: search_query)
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
