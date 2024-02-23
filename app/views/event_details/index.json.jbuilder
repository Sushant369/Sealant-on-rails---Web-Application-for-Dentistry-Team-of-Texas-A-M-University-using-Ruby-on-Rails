# frozen_string_literal: true

json.array! @event_details, partial: 'event_details/event_detail', as: :event_detail
