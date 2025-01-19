class ActsAsVotable::Vote < ApplicationRecord
    # Define the ransackable attributes
    def self.ransackable_attributes(auth_object = nil)
      [ "created_at", "id", "id_value", "updated_at", "votable_id", "votable_type", "vote_flag", "vote_scope", "vote_weight", "voter_id", "voter_type" ]
    end
end
