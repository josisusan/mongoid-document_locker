require 'spec_helper'

describe Mongoid::DocumentLocker do
  let(:demo) { Demo.new(name: "foo") }
  let(:existing_valid_demo) { Demo.create(name: 'Valid Demo')}
  let(:locked_demo) { Demo.create(name: 'Locked', lock: be_true)}

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

  describe '#unlock!' do
    it 'sets the lock to true and return true' do
      return_value  = locked_demo.reload.unlock!
      locked_demo.reload.lock.should be_false
      return_value.should be_true
    end
  end

  context 'For embedded document' do
    it 'should lock the document after saving' do
      embedded_demo = demo.create_embed_demo(name: 'EmbeddedDemo')
      embedded_demo.lock!
      embedded_demo.reload.lock.should be_true
    end

    describe '#unlock!' do
      it 'sets the lock to true and return true' do
        locked_embedded_demo = locked_demo.create_embed_demo(
                                  name: 'LockedEmbeddedDemo', 
                                  lock: true
                                )
        return_value  = locked_embedded_demo.unlock!
        locked_embedded_demo.reload.lock.should be_false
        return_value.should be_true
      end
  end    
  end
end