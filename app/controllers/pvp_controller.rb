require 'pubnub'
class PvpController < ApplicationController

    def start
        @pubnub = Pubnub.new(
            subscribe_key: ENV['PUBSUB'],
            publish_key: ENV['PUBPUB'],
            ssl: true,
            # uuid: 'battle-royale',
            connect_callback: lambda {|msg| pubnub.publish(channel: 'battle_royale', message: params[:team], http_sync: true)}
        )

        # @pubnub.subscribe(
        #     channels: :battle_royale
        # )
        @pubnub.subscribe(channels: 'battle_royale') do |envelope|
            puts envelope.result[:data][:messages]
            render json: envelope
        end
    end

    def attack
        @pubnub.publish(
            channel: :battle_royale,
            message: {attack_id: params[:attack_id], character_id: params[:character_id]}
        )do |envelope|
            render json: envelope
        end
    end
end
