# frozen_string_literal: true

require "support/node_equality"
require "support/helpers/context"

RSpec.describe Openapi3Parser::Node::Object do
  include Helpers::Context

  describe "#node_at" do
    subject { described_class.new(data, context).node_at(pointer) }

    let(:data) { {} }
    let(:context) do
      create_node_context(
        {},
        document_input: {
          "openapi" => "3.0.0",
          "info" => {
            "title" => "Minimal Openapi definition",
            "version" => "1.0.0"
          },
          "paths" => {}
        },
        pointer_segments: %w[info]
      )
    end

    context "when a absolute path is specified" do
      let(:pointer) { "#/paths" }

      it { is_expected.to be_instance_of(Openapi3Parser::Node::Paths) }
    end

    context "when a relative path is specified" do
      let(:pointer) { "#version" }

      it { is_expected.to eq "1.0.0" }
    end

    context "when a .. path is specified" do
      let(:pointer) { "#.." }

      it { is_expected.to be_instance_of(Openapi3Parser::Node::Openapi) }
    end
  end

  it_behaves_like "node equality", {}

  describe "#values" do
    it "returns an array of values" do
      instance = described_class.new({ "a" => "value_a", "b" => "value_b" },
                                     create_node_context({}))

      expect(instance.values).to eq %w[value_a value_b]
    end
  end
end
