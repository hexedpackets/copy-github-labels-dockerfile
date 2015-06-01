# Modified from: https://gist.github.com/tylerpearson/fda868b17ca0d4e4c7e8

require 'octokit'

# https://help.github.com/articles/creating-an-access-token-for-command-line-use/
# requires "repo" and/or "public_repo" permissions, depending on the repos being copied
client = Octokit::Client.new(:access_token => ENV["ACCESS_TOKEN"])

COPY_FROM_REPO = ARGV[0]
COPY_TO_REPO = ARGV[1]

current_labels = client.labels(COPY_FROM_REPO)

current_labels.each do |label|
  begin
    client.add_label(COPY_TO_REPO, label.name, label.color)
    puts "Added #{label.name} - ##{label.color}"
  rescue Exception => e
    puts "#{label.name} already exists" if e.class == Octokit::UnprocessableEntity
  end
end
