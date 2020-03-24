# Be sure to restart your server when you modify this file.
#
# +grant_on+ accepts:
# * Nothing (always grants)
# * A block which evaluates to boolean (recieves the object as parameter)
# * A block with a hash composed of methods to run on the target object with
#   expected values (+votes: 5+ for instance).
#
# +grant_on+ can have a +:to+ method name, which called over the target object
# should retrieve the object to badge (could be +:user+, +:self+, +:follower+,
# etc). If it's not defined merit will apply the badge to the user who
# triggered the action (:action_user by default). If it's :itself, it badges
# the created object (new user for instance).
#
# The :temporary option indicates that if the condition doesn't hold but the
# badge is granted, then it's removed. It's false by default (badges are kept
# forever).

module Merit
  class BadgeRules
    include Merit::BadgeRulesMethods

    def initialize
      # If it creates user, grant badge
      # Should be "current_user" after registration for badge to be granted.
      # Find badge by badge_id, badge_id takes presidence over badge
      # grant_on 'users#create', badge_id: 7, badge: 'just-registered', to: :itself

      # If it has 10 comments, grant commenter-10 badge
      # grant_on 'comments#create', badge: "commenter" do |comment|
      #   comment.user.comments.count > 16
      # end

      grant_on "pins#create", badge: "Apprentice guide", temporary: true do |pin|
        (1..4).include? pin.user.pins.count
      end

      grant_on "pins#create", badge: "Guide", temporary: true do |pin|
        (5..15).include? pin.user.pins.count
      end

      grant_on "pins#create", badge: "Veteran guide", temporary: true do |pin|
        pin.user.pins.count > 15
      end

      grant_on "comments#create", badge: "Taciturn", temporary: true do |comment|
        (1..24).include? comment.user.comments.count
      end

      grant_on "comments#create", badge: "Talker", temporary: true do |comment|
        (25..99).include? comment.user.comments.count
      end

      grant_on "comments#create", badge: "Chatty", temporary: true do |comment|
        (100..299).include? comment.user.comments.count
      end

      grant_on "comments#create", badge: "Deafening", temporary: true do |comment|
        comment.user.comments.count > 299
      end

      grant_on "votes#create", badge: "Judge", temporary: true do |vote|
        (1..50).include? vote.user.votes.count
      end

      grant_on "votes#create", badge: "Critic", temporary: true do |vote|
        (50..149).include? vote.user.votes.count
      end

      grant_on "votes#create", badge: "Know-it-all", temporary: true do |vote|
        vote.user.votes.count > 149
      end

      grant_on "visits#create", badge: "Curious", temporary: true do |visit|
        visit.user.visits.count > 10
      end

      grant_on "visits#create", badge: "Wanderer", temporary: true do |visit|
        visit.user.visits.count > 25
      end

      grant_on "visits#create", badge: "Explorer", temporary: true do |visit|
        visit.user.visits.count > 100
      end

      # If it has 5 votes, grant relevant-commenter badge
      # grant_on 'comments#vote', badge: 'relevant-commenter',
      #   to: :user do |comment|
      #
      #   comment.votes.count == 5
      # end

      # Changes his name by one wider than 4 chars (arbitrary ruby code case)
      # grant_on 'registrations#update', badge: 'autobiographer',
      #   temporary: true, model_name: 'User' do |user|
      #
      #   user.name.length > 4
      # end
    end
  end
end
