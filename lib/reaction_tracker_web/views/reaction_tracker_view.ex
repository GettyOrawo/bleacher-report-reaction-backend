defmodule ReactionTrackerWeb.TrackerView do

  use ReactionTrackerWeb, :view

  def render("tracker.json", %{tracker: tracker}) do
    %{
      type: tracker.type,
      action: tracker.action,
      content_id: tracker.content_id,
      user_id: tracker.user_id,
      reaction_type: tracker.reaction_type
    }
  end

  def render("reaction_count.json", %{reaction_count: reaction_count, content_id: content_id}) do
    %{
      content_id: content_id,
      reaction_count: reaction_count
    }
  end

  def render("index.json", %{trackers: trackers}) do
    %{data: render_many(trackers, ReactionTrackerWeb.TrackerView, "tracker.json")}
  end

  def render("show.json", %{tracker: tracker}) do
    %{data: render_one(tracker, ReactionTrackerWeb.TrackerView, "tracker.json")}
  end

end