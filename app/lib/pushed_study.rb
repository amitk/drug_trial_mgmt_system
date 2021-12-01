class PushedStudy
  def initialize(studies)
    @studies = studies.clone
  end

  def process
    ActiveRecord::Base.transaction do
      @studies.each do |study|
        Study.find_or_create_by(
          uuid: study['uuid'],
          name: study['name'],
          drug: study['drug']
        )
      end
    end
    true
  end
end
