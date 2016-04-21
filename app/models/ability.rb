class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)
    alias_action :create, :read, :update, :destroy, :to => :crud

    if user.persisted?
      can :read, Question
      can :read, Course
      can :manage, Question, :user_id => user.id
      can :manage, Course, :user_id => user.id
      # can :crud, Cthread, :course => { :user_id => user.id }
    else
      # Guest user are not allowed
    end
    
    if (user.user_type == "instructor")
      can :crud, Cthread
      can :crud, Question
      can :crud, Response
    else
      can :read, Cthread
    end
    
    # if user.user_type == "instructor"
    #   can :create, Cthread
    # end
    
    # Define abilities for the passed in user here. For example:
    #
    #   user ||= User.new # guest user (not logged in)
    #   if user.admin?
    #     can :manage, :all
    #   else
    #     can :read, :all
    #   end
    #
    # The first argument to `can` is the action you are giving the user 
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on. 
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #  can :read, Project, :category => { :visible => true }
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
