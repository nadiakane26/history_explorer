# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

user_ids = [13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24]

landmark_data = [
  {
    name: "1918 Fire/Kettle River",
    address: "3964 Main St, Kettle River, MN 55757",
    region_name: "Northeast",
    description: "1918 Fire historic marker in front of the Veterans Building. Ignited by a spark from a train, the 1918 fires were devastating: hundreds were killed, 38 communities were destroyed, and 250k acres were burned. A mass grave was dug in Moose Lake in order to bury victims quickly."
  },
  {
    name: "1997 Red River Flood",
    address: "100-198 Demers Ave, Grand Forks, ND 58201",
    region_name: "Northwest",
    description: "Cross the Sorlie Bridge into Grand Forks, ND to check-in at the flood memorial obelisk on the banks of the Red River south of the bridge. The obelisk marks historic floods on the river, none as high as the devastating 1997 flood. Today, the Greater Grand Forks Greenway lines the riverbanks, a 2,200 acres parkland constructed post-1997 to provide both flood protection and recreation. Learn more about the '97 flood in MNHS' oral history project at the link."
  },
  {
    name: "9/11 Memorial in Marshall",
    address: "101 E Main St, Marshall, MN 56258",
    region_name: "Southwest",
    description: "The 9/11 Memorial in Marshall in Memorial Park at the center of town, A beautiful and sobering tribute to those who lost their lives in the 2001 attacks. The memorial features a steel beam from the World Trade Center in New York City, brought to Marshall by Craig Schaefer in 2011. It is a historic object that connects us to a momentous point in US history. The memorial is also the starting point to the town's self-guided history walking tour."
  },
  {
    name: "A Three-way Continental Divide",
    address: "Anchor Lake Rd, Eveleth, MN 55734",
    region_name: "Northeast",
    description: "Check-in at the marker for the 3-way continental divide at the Anchor Lake rest area on US-53, 11 miles south of Eveleth. Minnesota may not have the Rocky Mountains, but it does have 3 continental divides. Water in Minnesota can flow 1 of 3 ways: north into Hudson Bay, east into the Atlantic, or south to the Gulf of Mexico. The exact triple divide point, known as the Hill of Three Waters to the Ojibwe, was located where the Hull-Rust-Mahoning mine is today in Hibbing."
  },
  {
    name: "Allan Spear",
    address: "2500 Colfax Ave South, Minneapolis, MN 55405",
    region_name: "Metro",
    description: "The Allan Spear LGBT Equality Colonnade in Minneapolis’ Mueller Park was the 1st openly gay man in the US to serve as a state legislator, elected to the MN Senate in 1972. He was a tireless champion for human rights and in 1993, after decades of work, he succeeded in having Minnesota's Human Rights Act amended to prohibit discrimination based on sexual orientation and gender identity."
  },
  {
    name: "Andrew Volstead House",
    address: "163 9th Ave, Granite Falls, MN 56241",
    region_name: "Southwest",
    description: "Check-in in front of the Andrew J. Volstead House at 163 9th Ave in Granite Falls. Home to Congressman Andrew Volstead, most famously known for authoring the National Prohibition Act in 1919 that detailed specific regulations for the 18th Amendment, he also set important groundwork for co-ops in the Capper-Volstead Act. His wife Nellie also fought for women's suffrage. That's a lot of significant history for one household!"
  },
  {
    name: "Anoka Halloween Capital of the World",
    address: "2015 1st Ave, Anoka, MN 55303",
    region_name: "Metro",
    description: "The witch medallion in the plaza outside city hall proclaims Anoka as the Halloween Capital of the World, a title it has held since 1937. Its origin dates back to 1920 when Anoka held its 1st community Halloween celebration, believed to be the 1st city to do so. The celebration began as a way to divert youngsters from Halloween pranks, but has evolved into a multi-day witches brew of activities."
  },
  {
    name: "Assumption Chapel (Grasshoppers)",
    address: "22912 Chapel Hill Rd, Cold Spring, MN 56320",
    region_name: "Central",
    description: "The Assumption Chapel in Cold Spring, also known as the Grasshopper Chapel. In 1877, millions of Rocky Mountain Locusts destroyed the grain crops of farmers across the state. Gov. Pillsbury proclaimed April 26th a day of prayer in response. The people of Cold Spring vowed that if the Blessed Virgin would rid them of the locusts, they would build a chapel. The locusts disappeared and the people kept their promise."
  },
  {
    name: "Lake Benton Opera House",
    address: "118 E Benton St, Lake Benton, MN 56149",
    region_name: "Southwest",
    description: "Opened in 1896, it represents true community spirit. After its predecessor burned, community members bought 96 shares at $100 a piece to fund construction of this brick building. in 1970, it was slated for demolition, but another community effort saved it from the wrecking ball & it was listed on the National Register of Historic Places in 1977. It still houses performances today!"
  },
  {
    name: "Beaver Bay/John Beargrease",
    address: "100-198 Lax Lake Rd, Silver Bay, MN 55614",
    region_name: "Northeast",
    description: "Beaver Bay was home to Esquabi John Beargrease, an Ojibwe man who became legendary for delivering mail between Two Harbors & Grand Marais for decades beginning in 1879. Along with his brothers, Beargrease was a reliable connection to the outside world for remote North Shore communities, carrying mail year-round by boat, foot, & dogsled. Today, the John Beargrease Sled Dog Marathon honors his legacy. "
  },
  {
    name: "St. Bonifacius Missile Battery",
    address: "8822 Wildwood Ave, St Bonifacius, MN 55375",
    region_name: "Metro",
    description: "The replica of the Nike missile in St. Bonifacius' Missile Park. From 1959-1971, a guided missile base was located a few miles NW from here. Part of a Cold War missile defense network meant to protect the Twin Cities from Soviet attack, the base was 1 of 4 in the area. It operated without incident & never fired a missile."
  },
  {
    name: "LeDuc Historic Estate",
    address: "1629 Vermillion St, Hastings, MN 55033",
    region_name: "Metro",
    description: " The first historic property acquired by MNHS when it was donated to them in 1958. However, the previous owner lived there until 1986 and it wasn't open to the public until 2005, when MNHS transferred the property to the city of Hastings. Today, you can tour this Civil War-era Gothic Revival house thanks to the Dakota County Historical Society, who operates this architectural gem."
  },
  {
    name: "Barberg-Selvälä-Salmonson Sauna",
    address: "2001 County Rd 3 SW, Cokato, MN 55321",
    region_name: "Central",
    description: "What is believed to be the oldest sauna in Minnesotamoved here in 1979 by the local Finnish American Hist. Society. The Savu Sauna was built in 1868 by 3 families of Finnish settlers. The Finnish custom of using the sauna without clothing caused quite a stir among neighbors, especially after a road was built next to it. "
  },

]

landmark_data.each do |landmark|
  # Find the region by name
  region = Region.find_by(name: landmark[:region_name])
  
  # If the region exists, create the landmark and associate it with the region
  if region
    # Find a random user to assign this landmark to
    user = User.find(user_ids[index % user_ids.length]) 
    
    # Create the landmark for the user
    user.landmarks.create!(
      name: landmark[:name],
      address: landmark[:address],
      region: region,
      description: landmark[:description] # You can add more attributes if needed
    )
  end
end

puts "Seeding completed successfully."