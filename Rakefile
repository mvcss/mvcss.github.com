desc "Generate flat files with Middleman"
task :generate do
  puts "## Generating site with Middleman"
  system "./bin/middleman build --clean"
  cd "build" do
    system "git init"
    system "git remote add origin git@github.com:mvcss/mvcss.github.com.git"
  end
end

desc "Push the build to the gh-pages branch on GitHub"
task :push do
  puts "## Deploying build to GitHub Pages"
  cd "build" do
    system "git add ."
    system "git add -u"
    system "git commit -m \"Site updated at #{Time.now.utc}\""
    system "git push origin master:gh-pages --force"
  end
end

desc "Generate flat files and deploy to GitHub Pages"
task :deploy => [:generate, :push] do
end
