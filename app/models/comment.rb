class Comment < ApplicationRecord

  def self.all_text
    all.order(:id).map { |comment| comment.text }.join
  end

  def self.all_text_json
    { "text" => all_text }.to_json
  end

  def self.filter(args = {})
    results = nil
    args.each do |attribute, values|
      attribute_results = nil
      unless values.nil? || values.include?("all")
        values.each do |value|
          if attribute_results
            attribute_results = where("#{attribute} = ?", "#{value}").or(attribute_results)
          else
            attribute_results = where("#{attribute} = ?", "#{value}")
          end
        end
      end
      if results && attribute_results
        results = results.merge(attribute_results)
      else
        results = attribute_results
      end
    end  
    results || all
  end
end


