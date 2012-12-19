current_dir = ::File.dirname(::File.absolute_path(__FILE__))
cookbook_path "#{current_dir}/cookbooks", "#{current_dir}/site-cookbooks"

solo_json_file = "#{current_dir}/.chef/ii-solo.json"
open(solo_json_file,'w+') do |f|
  f.write(
    {
      "run_list" => [
        "recipe[ii-iso]"
        ]
    }.to_json
    )
end
json_attribs solo_json_file
