require 'spec_helper'
require 'vm_translator/command/pop'

describe VMTranslator::Command::Pop do
  let(:subject) { described_class.new('local', 1) }
  let(:expected) { "@1\nD=A\n@LCL\nD=M+D\n@addr\nM=D\n@SP\nM=M-1\nA=M\nD=M\n@addr\nM=D\n" }

  it 'exists' do
    expect(subject).to be_kind_of(VMTranslator::Command::Pop)
  end

  it 'returns asm code' do
    expect(subject.to_asm).to eq(expected)
  end
end
