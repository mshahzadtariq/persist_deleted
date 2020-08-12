module Mongoid
  module PersistDeleted
    extend ActiveSupport::Concern

    included do

      field :is_deleted, type: Boolean, default: false

      default_scope -> { where(:is_deleted.in => [nil, false]) }

      scope :with_deleted, -> { self.unscoped.where(:is_deleted.in => [nil, false, true]) }
      scope :only_deleted, -> { self.unscoped.where(is_deleted: true) }

      def destroy
        self.set(:is_deleted => true)
      end

      def recover
        self.set(:is_deleted => false)
      end

    end

  end
end
