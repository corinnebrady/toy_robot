require_relative "./spec_helper.rb"

describe "Robot" do
  let(:robot) { Robot.new }

  describe "#place" do
    context "valid coordinates" do
      it "assigns the variable" do
        robot.place({x: 2, y: 3}, "east")

        expect(robot.x).to eq(2)
        expect(robot.y).to eq(3)
        expect(robot.direction).to eq("east")
      end
    end

    context "invalid input" do
      it "raises an error with invalid coordinates" do
        expect { robot.place({x: 7, y: 8},"north") }.to raise_error("Those coordinates aren't on the table!")
      end

      it "raises an error with invalid directions" do
        expect { robot.place({x: 2, y: 3},"n") }.to raise_error("That isn't a good direction, try again and make sure to type out the full word")
      end
    end
  end

  describe "#turn_left" do
    it "changes the direction from east to north" do
      robot.place({x: 2, y: 3}, "east")
      robot.turn_left

      expect(robot.direction).to eq("north")
    end

    it "changes the direction from north to west" do
      robot.place({x: 2, y: 3}, "north")
      robot.turn_left

      expect(robot.direction).to eq("west")
    end

    it "changes the direction from west to south" do
      robot.place({x: 2, y: 3}, "west")
      robot.turn_left

      expect(robot.direction).to eq("south")
    end

    it "changes the direction from south to east" do
      robot.place({x: 2, y: 3}, "south")
      robot.turn_left

      expect(robot.direction).to eq("east")
    end

    context "it has not been placed yet" do
      it "raises an error" do
        expect { robot.turn_left }.to raise_error("Don't you think I should be placed on the table first?")
      end
    end
  end

  describe "#turn_right" do
    it "changes the direction from east to south" do
      robot.place({x: 2, y: 3}, "east")
      robot.turn_right

      expect(robot.direction).to eq("south")
    end

    it "changes the direction from south to west" do
      robot.place({x: 2, y: 3}, "south")
      robot.turn_right

      expect(robot.direction).to eq("west")
    end

    it "changes the direction from west to north" do
      robot.place({x: 2, y: 3}, "west")
      robot.turn_right

      expect(robot.direction).to eq("north")
    end

    it "changes the direction from north to east" do
      robot.place({x: 2, y: 3}, "north")
      robot.turn_right

      expect(robot.direction).to eq("east")
    end

    context "it has not been placed yet" do
      it "raises an error" do
        expect { robot.turn_right }.to raise_error("Don't you think I should be placed on the table first?")
      end
    end

  end

  describe "#move" do
    context "valid move" do
      it "moves the robot north" do
        robot.place({x: 2, y: 2}, "north")
        robot.move

        expect(robot.y).to eq(3)
      end

      it "moves the robot east" do
        robot.place({x: 2, y: 2}, "east")
        robot.move

        expect(robot.x).to eq(3)
      end

      it "moves the robot south" do
        robot.place({x: 2, y: 2}, "south")
        robot.move

        expect(robot.y).to eq(1)
      end

      it "moves the robot west" do
        robot.place({x: 2, y: 2}, "west")
        robot.move

        expect(robot.x).to eq(1)
      end
    end

    context "invalid move" do
      it "raises an error when moving north" do
        robot.place({x: 2, y: 4}, "north")

        expect { robot.move }.to raise_error("No! I must stay on the table!")
      end

      it "raises an error when moving south" do
        robot.place({x: 2, y: 0}, "south")

        expect { robot.move }.to raise_error("No! I must stay on the table!")
      end

      it "raises an error when moving east" do
        robot.place({x: 4, y: 2}, "east")

        expect { robot.move }.to raise_error("No! I must stay on the table!")
      end

      it "raises an error when moving west" do
        robot.place({x: 0, y: 2}, "west")

        expect { robot.move }.to raise_error("No! I must stay on the table!")
      end
    end

    context "it has not been placed yet" do
      it "raises an error" do
        expect { robot.move }.to raise_error("Don't you think I should be placed on the table first?")
      end
    end

  end

  describe "#move" do
    context "after the robot has been placed" do

      it "passes the correct string" do
        robot.place({x: 2, y: 2}, "north")

        expect(robot.report).to eq("My position is (2, 2) north")
      end
    end

    context "it has not been placed yet" do
      it "raises an error" do
        expect { robot.report }.to raise_error("Don't you think I should be placed on the table first?")
      end
    end

  end
end

