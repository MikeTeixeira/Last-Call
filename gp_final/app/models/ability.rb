class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example:
    #

    if user.admin?

        can :manage, Restaurant do |restaurant|
            restaurant.id = user
        end


    else
        can :update, User do |user|
            user.id == user
        end

        can :destroy, User do |user|
            user.id == user
        end

        can :edit, User do |user|
            user.id == user
        end

        # ORDER SECTION 

        can :create, Order

        can :edit, Order do |order|
            order.user == user
        end

        can :destroy, Order do |order|
            order.user == user
        end

        # RESTAURANT SECTION

        can :create, Restaurant

        can :edit, Restaurant do |restaurant|
            restaurant.users == user
        end

        can :destroy, Restaurant do |restaurant|
            restaurant.users == user
        end 

    end
      # user ||= User.new # guest user (not logged in)
      # if user.admin?
      #   can :manage, :all
      # else
      #   can :read, :all
      # end
    #
    # The first argument to `can` is the action you are giving the user 
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on. 
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/ryanb/cancan/wiki/Defining-Abilities
  end
end
