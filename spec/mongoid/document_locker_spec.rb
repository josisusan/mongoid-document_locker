require 'spec_helper'

describe Mongoid::DocumentLocker do
  let(:demo) { Demo.new(name: "foo") }
  let(:existing_valid_demo) { Demo.create(name: 'Valid Demo')}

  it 'should set the lock of document to false'  do
    demo.lock.should be_false
  end

  describe '#lock!' do
    it 'sets the lock to true and return true' do
      return_value  = existing_valid_demo.lock!
      existing_valid_demo.reload.lock.should be_true
      return_value.should be_true
    end
  end
end