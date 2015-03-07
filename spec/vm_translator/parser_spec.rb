require 'spec_helper'
require 'vm_translator/parser'
require 'vm_translator/command/pop'
require 'vm_translator/command/push'

describe VMTranslator::Parser do
  let(:strings) { ['pop local 1', 'push static 12'] }
  let(:subject) { described_class.new(strings) }

  it 'parses pop command' do
    expect(subject.parsed[0]).to be_kind_of(VMTranslator::Command::Pop)
  end

  it 'parses push command' do
    expect(subject.parsed[1]).to be_kind_of(VMTranslator::Command::Push)
  end
end
