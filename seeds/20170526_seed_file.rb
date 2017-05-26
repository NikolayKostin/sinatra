Sequel.seed(:development, :test) do # Applies only to "development" and "test" environments
  def run
    puts 'in Main 20170101_seeeds.rb - all truncations'
    # DB[:table].truncate(:cascade => true, :only=>true, :restart=>true)
    [:applies, :geeks, :jobs, :companies].each { |model| puts model; DB[model].truncate(:cascade => true, :restart=>true)}
    puts 'all models deletion (truncation) with Primary_key restart'





# Важен порядок ввода, т.к. есть Foreign Key. Те таблицы где есть FK идут в конце

dataset_comp=DB[:companies]
dataset_comp.insert(:name => 'MoGo', :location => 'New York')
dataset_comp.insert(:name => 'Wirkkle', :location => 'London')
dataset_comp.insert(:name => 'Artesis', :location => 'Saint-Petersburg')
dataset_comp.insert(:name => 'BuildEmpire', :location => 'London')

dataset_geeks=DB[:geeks]
dataset_geeks.insert(:name => 'Anna Ivanova', :stack => 'RubyOnRails, JS', :resume => true)
dataset_geeks.insert(:name => 'Nick Petrov', :stack => 'Node, JS', :resume => false)
dataset_geeks.insert(:name => 'Michail Smirnov', :stack => 'Php, HTML', :resume => true)
dataset_geeks.insert(:name => 'Petr Antonov', :stack => 'Ruby, front-end', :resume => true)
dataset_geeks.insert(:name => 'Nina Alekseeva', :stack => 'full stack web', :resume => true)
dataset_geeks.insert(:name => 'Egor Nikolaev', :stack => 'C++, .NET', :resume => false)
dataset_geeks.insert(:name => 'Fyodor Pletnev', :stack => 'Java', :resume => true)

dataset_jobs = DB[:jobs]
dataset_jobs.insert(:name => 'Sinatra React', :place => 'Remote', :company_id => 1)
dataset_jobs.insert(:name => 'Ruby React', :place => 'Contract', :company_id => 2)
dataset_jobs.insert(:name => 'React', :place => 'Remote', :company_id => 3)
dataset_jobs.insert(:name => 'Node React', :place => 'Permanent', :company_id => 1)
dataset_jobs.insert(:name => 'Ruby on Rails', :place => 'Remote', :company_id => 4)
dataset_jobs.insert(:name => 'Node', :place => 'Permanent', :company_id => 4)
dataset_jobs.insert(:name => 'Javascript CSS HTML', :place => 'Permanent', :company_id => 4)

dataset_applies = DB[:applies]
dataset_applies.insert(:read => true, :invited => false, :job_id => 1, :geek_id => 1)
dataset_applies.insert(:read => false, :invited => false, :job_id => 2, :geek_id => 3)
dataset_applies.insert(:read => true, :invited => true, :job_id => 1, :geek_id => 2)
dataset_applies.insert(:read => false, :invited => false, :job_id => 3, :geek_id => 1)
dataset_applies.insert(:read => false, :invited => false, :job_id => 5, :geek_id => 2)
dataset_applies.insert(:read => true, :invited => true, :job_id => 2, :geek_id => 4)

  end
end