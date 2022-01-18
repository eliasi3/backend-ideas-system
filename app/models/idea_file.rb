class IdeaFile < ApplicationRecord
  belongs_to :idea
  
  def self.upload_arquivo(arquivo, diretorio)
        
    FileUtils.mkdir(diretorio) unless File.exists?(diretorio)

    File.open(File.join(diretorio, arquivo.original_filename), "wb") { |f| f.write(arquivo.read) }

  end
  
end
