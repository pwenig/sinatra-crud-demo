Sequel.migration do

  up do
    create_table(:songs) do
      primary_key :id
      String :title
      String :album
      String :date_of_release
    end
  end

  down do
    drop_table(:songs)
  end

end