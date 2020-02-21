require 'pubnub'
class PvpController < ApplicationController

    def start
        @pubnub = Pubnub.new(
            subscribe_key: ENV['PUBSUB'],
            publish_key: ENV['PUBPUB'],
            ssl: true,
            uuid: 'battle-royale'
        )
    end
end
