# include legacy_mapper module into ApplicationRecord
require 'legacy_mapper'
ApplicationRecord.send(:include, ::LegacyMapper)
