/*
Copyright © 2022

*/
package cmd

import (
	"fmt"
	"github.com/spf13/cobra"
	"gogogo/build"
)

var architecture string
var opsystem string

// buildCmd represents the build command
var buildCmd = &cobra.Command{
	Use:   "build",
	Short: "Build Accord-Arome",
	Long:  `Build Accord-Arome for different architectures`,
	Run: func(cmd *cobra.Command, args []string) {
		fmt.Println("Build called")
		build.StartBuild(architecture, opsystem)
	},
}

func init() {
	rootCmd.AddCommand(buildCmd)

	// Here you will define your flags and configuration settings.

	// Cobra supports Persistent Flags which will work for this command
	// and all subcommands, e.g.:
	// buildCmd.PersistentFlags().String("foo", "", "A help for foo")

	// Cobra supports local flags which will only run when this command
	// is called directly:
	//buildCmd.Flags().BoolP(&architecture, "architecture", "a", false, "Specify the target architecture")
	//buildCmd.Flags().BoolP("os", "o", false, "Specify the target OS")
	buildCmd.Flags().StringVarP(&architecture, "architecture", "a", "", "Specify the target architecture [amd64, arm64, 386]")
	buildCmd.MarkFlagRequired("architecture")
	buildCmd.Flags().StringVarP(&opsystem, "os", "o", "", "Specify the target OS [CentOS, Ubuntu, MacOS]")
	buildCmd.MarkFlagRequired("os")
}
