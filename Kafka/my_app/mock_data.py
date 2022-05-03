from faker import Faker

fake = Faker()

def get_user_auth_data():
    return {
        "NAME" : fake.name(),
        "ADDRESS" : fake.address(),
        "CREATED_AT" : fake.year()
    }

if __name__ == "__main__":
    print(get_user_auth_data())