#json.array! @visitors, partial: 'api/users/show', as: :user
json.partial! 'api/users/index', users: @visitors