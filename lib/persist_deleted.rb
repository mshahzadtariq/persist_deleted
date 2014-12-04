module Mongoid
  module PersistDeleted
    extend ActiveSupport::Concern

    included do

      field :deleted, type: Boolean, default: false

      default_scope -> { where(:deleted.in => [nil, false]) }

      scope :with_deleted, -> { self.unscoped.where(:deleted.in => [nil, false, true]) }
      scope :only_deleted, -> { self.unscoped.where(deleted: true) }

      def destroy
        self.set(:deleted => true)
      end

      def recover
        self.set(:deleted => false)
      end

    end

  end
end
