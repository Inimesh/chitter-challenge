describe DatabaseConnection do
  dbname = 'chitter_test'
  describe '.setup' do
    it 'creates a database connection' do
      expect(PG).to receive(:connect).with(dbname: dbname)

      DatabaseConnection.setup(dbname)
    end
  end
  
  describe '.connection' do
    it 'returns a database connection object' do
      connection = DatabaseConnection.setup(dbname)
      expect(DatabaseConnection.connection).to eq connection 
    end
  end

  describe '.query' do
    it 'performs an SQL query via PG' do
      connection = DatabaseConnection.setup(dbname)

      expect(connection).to receive(:exec_params).with("SELECT * FROM peeps", [])

      DatabaseConnection.query("SELECT * FROM peeps")
    end
  end

end