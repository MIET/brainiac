require 'spec_helper'

describe Question do
  before(:all) do
    @step = Step.new(step_number: 1, vc_step_desc: 'test step')
    @step.save

    Question.new(step_id: @step.id,
                 step_number: @step[:step_number],
                 n_number: 1,
                 vc_type: 'text',
                 vc_text: 'test new question',
                 d_time_start: Time.now(),
                 d_time_stop: Time.local(2013,11,10)).save
  end

  before(:each) do
    @step = Step.find_by(:step_number, 1)
  end

  it 'add question' do
    @step[:vc_step_desc].should eq 'test step'
    question = Question.new(step_id: @step.id,
                            step_number: @step[:step_number],
                            n_number: 2,
                            vc_type: 'text',
                            vc_text: 'test question',
                            d_time_start: Time.now(),
                            d_time_stop: Time.local(2013,11,10))
    question.save.should be true
    question.destroy
  end

  it 'get current' do
    question = Question.current
    question[:n_number].should eq 1
    question[:vc_text].should eq 'test new question'
  end

  after(:all) do
    Question.all.each do |question|
      question.destroy
    end
    Step.all.each do |step|
      step.destroy
    end
  end
end
