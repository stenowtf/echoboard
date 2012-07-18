class StoryPdf < Prawn::Document
  def initialize(project, story, view)
    super()
    @project = project
    @story = story
    @view = view

    # stroke_axis
    text "#{@project.name} - #{@story.name}", size: 10, style: :bold
    bounding_box([0, cursor], :width => 486, :height => 300) do
      stroke do
        rounded_rectangle [0, cursor], 486, 300, 10
      end
      vertical_line cursor, cursor - 32, :at => 400
      text_box "#{Difficulty.find(@story.difficulty_id).value}", :size => 16, :at => [410, cursor - 10]
      move_down 10
      text_box "#{@story.name}", :at => [10, cursor], :height => 100, size: 12, style: :bold
      move_down 12
      text_box "For a more detailed version of this story, check #{@view.project_story_url(@project, @story)}.", size: 6, :at => [10, cursor], :height => 100
      move_down 10
      stroke_horizontal_rule
      move_down 10
      text_box "Definition of done:", :at => [10, cursor], size: 12, :height => 100, size: 10, style: :bold
      move_down 12
      text_box "#{@view.strip_tags(@story.definition_of_done)}", :at => [10, cursor], :width => 466, :overflow => :shrink_to_fit
    end
  end
end
