defmodule ToyRobot.Robot do
  alias ToyRobot.Robot
  defstruct north: 0, east: 0, facing: :north

  @doc """
  Moves the robot one space in the direction it is facing.

  ## Examples

    iex> alias ToyRobot.Robot
    ToyRobot.Robot
    iex> robot = %Robot{north: 0, facing: :north}
    %Robot{north: 0, facing: :north}
    iex> robot |> Robot.move
    %Robot{north: 1}
  """
  def move(%Robot{facing: facing} = robot) do
    case facing do
      :north -> robot |> move_north()
      :south -> robot |> move_south()
      :east -> robot |> move_east()
      :west -> robot |> move_west()
    end
  end

  @doc """
  Turns the robot left.

  ## Examples

    iex> alias ToyRobot.Robot
    ToyRobot.Robot
    iex> robot = %Robot{facing: :north}
    %Robot{facing: :north}
    iex> robot |> Robot.turn_left
    %Robot{facing: :west}
  """
  def turn_left(%Robot{facing: facing} = _robot) do
    case facing do
      :north -> %Robot{facing: :west}
      :east -> %Robot{facing: :north}
      :south -> %Robot{facing: :east}
      :west -> %Robot{facing: :south}
    end
  end

  defp move_east(robot) do
    %Robot{east: robot.east + 1}
  end

  defp move_west(robot) do
    %Robot{east: robot.east - 1}
  end

  defp move_north(robot) do
    %Robot{north: robot.north + 1}
  end

  defp move_south(robot) do
    %Robot{north: robot.north - 1}
  end
end
