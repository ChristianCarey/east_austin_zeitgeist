class Comment < ApplicationRecord

  def self.all_text
    all.order(:id).map { |comment| comment.text }.join
  end

  def self.all_text_json
    { "text" => all_text }.to_json
  end

  # TODO this will include any record requested by either attribute, even if its other attributes don't match the selected ones 
  
  def self.filter(args = {})
    results = nil
    args.each do |attribute, values|
      unless values.nil? || values.include?("all")
        values.each do |value|
          if results
            results = where("#{attribute} = ?", "#{value}").or(results)
          else
            results = where("#{attribute} = ?", "#{value}")
          end
        end
      end
    end  
    results || all
  end
end


