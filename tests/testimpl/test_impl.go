package testimpl

import (
	"os"
	"os/exec"
	"testing"

	"github.com/gruntwork-io/terratest/modules/terraform"
	"github.com/launchbynttdata/lcaf-component-terratest/types"
	"github.com/stretchr/testify/assert"
)

func TestComposableComplete(t *testing.T, ctx types.TestContext) {
	subscriptionId := os.Getenv("ARM_SUBSCRIPTION_ID")

	if len(subscriptionId) == 0 {
		t.Fatal("ARM_SUBSCRIPTION_ID environment variable is not set")
	}

	registryName := terraform.Output(t, ctx.TerratestTerraformOptions(), "container_registry_name")
	tokenName := terraform.Output(t, ctx.TerratestTerraformOptions(), "token_name")
	password1 := terraform.Output(t, ctx.TerratestTerraformOptions(), "password1")
	password2 := terraform.Output(t, ctx.TerratestTerraformOptions(), "password2")

	t.Run("LogInWithPassword1", func(t *testing.T) {
		// Execute Azure CLI login command
		cmd := exec.Command("az", "acr", "login", "-n", registryName, "-u", tokenName, "-p", password1)

		output, err := cmd.CombinedOutput()
		if err != nil {
			t.Fatalf("Failed to login to Azure Container Registry: %v\n%v\nOutput: %s", cmd.Args, err, string(output))
		}
		assert.NoError(t, err, "Azure Container Registry login should succeed")
		t.Logf("Successfully logged in to ACR %s with token %s", registryName, tokenName)
	})

	t.Run("LogInWithPassword2", func(t *testing.T) {
		// Execute Azure CLI login command
		cmd := exec.Command("az", "acr", "login", "-n", registryName, "-u", tokenName, "-p", password2)

		output, err := cmd.CombinedOutput()
		if err != nil {
			t.Fatalf("Failed to login to Azure Container Registry: %v\nOutput: %s", err, string(output))
		}
		assert.NoError(t, err, "Azure Container Registry login should succeed")
		t.Logf("Successfully logged in to ACR %s with token %s", registryName, tokenName)
	})
}
