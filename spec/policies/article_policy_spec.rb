require "rails_helper"

describe ArticlePolicy do
  let(:current_user) { build :user }

  subject { described_class }

  permissions :manage? do
    context "with own article" do
      let(:article) { build :article, user: current_user }

      it "allows manage article" do
        expect(subject).to permit(current_user, article)
      end
    end

    context "with other article" do
      let(:article) { build :article }

      it "denies manage article" do
        expect(subject).not_to permit(current_user, article)
      end
    end
  end

  permissions :show? do
    context "with guest user" do
      let(:current_user) { nil }

      context "with free article" do
        let(:article) { build :article }

        it "allows view article" do
          expect(subject).to permit(current_user, article)
        end
      end

      context "with paid article" do
        let(:article) { build :article, :paid }

        it "denies view article" do
          expect(subject).not_to permit(current_user, article)
        end
      end
    end

    context "with signed in user" do
      context "with free article" do
        let(:article) { build :article }

        it "allows view article" do
          expect(subject).to permit(current_user, article)
        end
      end

      context "with own paid article" do
        let(:article) { build :article, :paid, user: current_user }

        it "allows view article" do
          expect(subject).to permit(current_user, article)
        end
      end

      context "with not owned paid article" do
        let(:article) { build :article, :paid }

        it "denies view article" do
          expect(subject).not_to permit(current_user, article)
        end
      end

      context "with subscribed article" do
        let(:author) { build :user }
        let(:article) { build :article, :paid, user: author }

        before do
          allow(current_user).to receive(:subscribed_to?).with(author).and_return(true)
        end

        it "allows view article" do
          expect(subject).to permit(current_user, article)
        end
      end

      context "with not subscribed paid article" do
        let(:author) { build :user }
        let(:article) { build :article, :paid, user: author }

        before do
          allow(current_user).to receive(:subscribed_to?).with(author).and_return(false)
        end

        it "denies view article" do
          expect(subject).not_to permit(current_user, article)
        end
      end
    end
  end
end
