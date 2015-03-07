require 'spec_helper'
require 'vm_translator/command/push'

describe VMTranslator::Command::Push do
  let(:subject) { described_class.new('constant', 1) }
  let(:expected) { "@1\nD=A\n@SP\nA=M\nM=D\n@SP\nM=M+1" }

  it 'exists' do
    expect(subject).to be_kind_of(VMTranslator::Command::Push)
  end

  it 'returns asm code' do
    expect(subject.to_asm).to eq(expected)
  end

  describe 'local' do
    let(:subject) { described_class.new('local', 10) }
    let(:expected) { "@10\nD=A\n@LCL\nD=M+D\n@addrM=D\nA=M\nD=M\n@SP\nA=M\nM=D\n@SP\nM=M+1\n" }

    it 'generates correct string' do
      expect(subject.to_asm).to eq(expected)
    end
  end
  describe 'pointer' do
    describe 'this' do
      let(:subject) { described_class.new('pointer', 0) }
      let(:expected) { "@THIS\nD=M\n@SP\nM=D\n@SP\nM=M+1" }

      it 'generates correct string' do
        expect(subject.to_asm).to eq(expected)
      end
    end

    describe 'that' do
      let(:subject) { described_class.new('pointer', 1) }
      let(:expected) { "@THAT\nD=M\n@SP\nM=D\n@SP\nM=M+1" }

      it 'generates correct string' do
        expect(subject.to_asm).to eq(expected)
      end
    end
  end
end
