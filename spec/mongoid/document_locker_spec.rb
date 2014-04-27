require 'spec_helper'

describe Mongoid::DocumentLocker do
  let(:demo) { Demo.new(name: "foo") }

  it 'should set the lock of document to true'  do
    demo.lock.should be_false
  end

end