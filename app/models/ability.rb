class Ability
  include CanCan::Ability

  def initialize(user)
    can :read, Portfolio
    unless user.nil?
      can :create, Portfolio, user_id: user.id
      can :destroy, Portfolio, user_id: user.id
      can :update, CoinPortfolio, portfolio: { user_id: user.id }
      can :destroy, CoinPortfolio, portfolio: { user_id: user.id }
    end
  end
end
