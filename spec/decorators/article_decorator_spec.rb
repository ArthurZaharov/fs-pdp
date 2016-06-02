require "rails_helper"

describe ArticleDecorator do
  subject(:decorator) { described_class.new(article) }

  describe "#type" do
    context "with free article" do
      let(:article) { build :article }

      it "returns grey span element" do
        expect(decorator.type).to eq("<span class=\"label radius secondary\">free article</span>")
      end
    end

    context "with paid article" do
      let(:article) { build :article, :paid }

      it "returns grey span element" do
        expect(decorator.type).to eq("<span class=\"label radius\">paid article</span>")
      end
    end
  end

  describe "#content_excerpt" do
    context "with short content" do
      let(:content) { "Lorem ipsum dolor sit amet" }
      let(:article) { build :article, content: content }

      it "return full article content" do
        expect(decorator.content_excerpt).to eq(content)
      end
    end

    context "with long content" do
      let(:content) { "Lorem ipsum dolor sit amet" }
      let(:excerpt) { "Lorem ipsum ..." }
      let(:article) { build :article, content: content }

      before do
        allow_any_instance_of(String).to receive(:truncate).with(500, separator: " ").and_return(excerpt)
      end

      it "return excerpt of article's content" do
        expect(decorator.content_excerpt).to eq(excerpt)
      end
    end
  end
end
