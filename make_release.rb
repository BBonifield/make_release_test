
class Tagger

  def initialize
    if git_checkout_is_clean?
      get_tag_name_from_user
      make_release
    else
      notify_user "You cannot create a release when the git checkout has unstaged changes."
    end
  end


  private

  def git_checkout_is_clean?
    `git status`
    raise $?.inspect
    true
  end

  def notify_user str
    puts str
  end

  def get_tag_name_from_user
    puts "Enter the new tag name:"
    while true
      input = gets.chomp
      if is_valid_tag_name? input
        # valid name, exit
        break
      else
        puts "You must enter a tag name, try again:"
      end
    end
  end

  def is_valid_tag_name? input
    return input.length > 0
  end

  def make_release
    update_version
    make_tag
    update_release_branch
  end

  def update_version

  end

  def make_tag
    `git tag "#{@tag_name}"`
  end

  def update_release_branch

  end

end


Tagger.new
