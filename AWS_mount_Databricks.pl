# Replace xxxxx with your ACCESS_KEY and SECRET_KEY, which can be found in your AWS account management page.

ACCESS_KEY = "xxxxx"
# Encode the Secret Key as that can contain "/"
SECRET_KEY = "xxxxx".replace("/", "%2F")
# Bucket name is user defined during AWS setup.
AWS_BUCKET_NAME = "tappingtestbucket"
# Mount name is also defined here.
MOUNT_NAME = "firstmount"

dbutils.fs.mount("s3a://%s:%s@%s" % (ACCESS_KEY, SECRET_KEY, AWS_BUCKET_NAME), "/mnt/%s" % MOUNT_NAME)
display(dbutils.fs.ls("/mnt/%s" % MOUNT_NAME))

# Load the data
census_data = sc.textFile("/mnt/firstmount/census.csv")
# Count the number of data
census_data.count()