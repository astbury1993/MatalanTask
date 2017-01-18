class CreateSlugs < ActiveRecord::Migration

      def change
          create_table :friendly_id_slugs do |t|
              t.string    :slug,  :null => false
              t.integer   :sluggable_id,  :null => false
              t.integer   :sluggable_type,
              t.string    :scope
              t.datetime  :created_at
          end
          add_index :friendly_id_slugs, :sluggable_id
          add_index :friendly_id_slugs, [:slug, :sluggable_type]
          add_index :friendly_id_slugs, [:slug, :sluggable_type, :scope], :unique => true
          add_index :friendly_id_slugs, :sluggable_type
      end
      

end
