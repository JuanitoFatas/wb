RSpec.describe WB::Shell do
  describe ".mkdir_p_touch" do
    it "works with argument contains slash" do
      path = "branch/name"

      pretend_directories_already_exists

      verify(FileUtils, receive: :touch, with_argument: path) do
        WB::Shell.mkdir_p_touch(path)
      end
    end

    def pretend_directories_already_exists
      allow(File).to receive(:exist?) { true }
    end

    def verify(object, receive:, with_argument:)
      allow(object).to receive(receive).with(with_argument) { true }

      yield

      expect(object).to have_received(receive).with(with_argument)
    end
  end
end
