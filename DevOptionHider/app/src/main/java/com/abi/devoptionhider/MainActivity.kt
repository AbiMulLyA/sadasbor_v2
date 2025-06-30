package com.abi.devoptionhider

import android.os.Bundle
import android.provider.Settings
import android.widget.Toast
import androidx.activity.ComponentActivity
import androidx.activity.compose.setContent
import androidx.activity.enableEdgeToEdge
import androidx.compose.foundation.layout.Arrangement
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.Spacer
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.layout.height
import androidx.compose.foundation.layout.padding
import androidx.compose.material3.Button
import androidx.compose.material3.Scaffold
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.platform.LocalContext
import androidx.compose.ui.tooling.preview.Preview
import androidx.compose.ui.unit.dp
import com.abi.devoptionhider.ui.theme.DevOptionHiderTheme

class MainActivity : ComponentActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        enableEdgeToEdge()
        setContent {
            DevOptionHiderTheme {
                Scaffold(modifier = Modifier.fillMaxSize()) { innerPadding ->
                    Column(
                        modifier = Modifier
                            .padding(innerPadding)
                            .fillMaxSize(),
                        verticalArrangement = Arrangement.Center,
                        horizontalAlignment = Alignment.CenterHorizontally
                    ) {
                        HideDeveloperOptionsButton()
                        Spacer(modifier = Modifier.height(16.dp))
                        ShowDeveloperOptionsButton()
                    }
                }
            }
        }
    }

    private fun hideDeveloperOptions() {
        try {
            // 1. Nonaktifkan USB debugging
            Settings.Global.putInt(
                contentResolver,
                Settings.Global.ADB_ENABLED,
                0
            )

            // 2. Manipulasi nilai pengaturan developer
            setMockSettings(false)

            Toast.makeText(
                this,
                "Developer options hidden from detection!",
                Toast.LENGTH_SHORT
            ).show()
        } catch (e: SecurityException) {
            showPermissionError()
        }
    }

    private fun showDeveloperOptions() {
        try {
            // 1. Aktifkan USB debugging
            Settings.Global.putInt(
                contentResolver,
                Settings.Global.ADB_ENABLED,
                1
            )

            // 2. Kembalikan nilai pengaturan developer
            setMockSettings(true)

            Toast.makeText(
                this,
                "Developer options visible to other apps!",
                Toast.LENGTH_SHORT
            ).show()
        } catch (e: SecurityException) {
            showPermissionError()
        }
    }

    private fun setMockSettings(showOptions: Boolean) {
        val value = if (showOptions) 1 else 0

        val mockValues = mapOf(
            Settings.Global.DEVELOPMENT_SETTINGS_ENABLED to value,
            "debug_app" to if (showOptions) null else "none",
            "wait_for_debugger" to if (showOptions) 1 else 0,
            "verifier_verify_adb_installs" to if (showOptions) 0 else 1,
            "package_verifier_enable" to if (showOptions) 0 else 1
        )

        mockValues.forEach { (key, value) ->
            try {
                when (value) {
                    is Int -> Settings.Global.putInt(contentResolver, key, value)
                    is String -> Settings.Global.putString(contentResolver, key, value)
                    null -> Settings.Global.putString(contentResolver, key, null)
                }
            } catch (e: Exception) {
                // Handle exception
            }
        }
    }

    private fun showPermissionError() {
        Toast.makeText(
            this,
            "Permission denied! Grant via ADB:\n" +
                    "adb shell pm grant $packageName android.permission.WRITE_SECURE_SETTINGS",
            Toast.LENGTH_LONG
        ).show()
    }

    @Composable
    fun HideDeveloperOptionsButton() {
        Button(
            onClick = { hideDeveloperOptions() },
            modifier = Modifier.padding(horizontal = 16.dp)
        ) {
            Text(text = "Sembunyikan Developer Options")
        }
    }

    @Composable
    fun ShowDeveloperOptionsButton() {
        Button(
            onClick = { showDeveloperOptions() },
            modifier = Modifier.padding(horizontal = 16.dp)
        ) {
            Text(text = "Tampilkan Developer Options")
        }
    }
}

@Preview(showBackground = true)
@Composable
fun DefaultPreview() {
    DevOptionHiderTheme {
        Column(
            modifier = Modifier.fillMaxSize(),
            verticalArrangement = Arrangement.Center,
            horizontalAlignment = Alignment.CenterHorizontally
        ) {
            Button(onClick = { /* For preview only */ }) {
                Text("Sembunyikan Developer Options")
            }
            Spacer(modifier = Modifier.height(16.dp))
            Button(onClick = { /* For preview only */ }) {
                Text("Tampilkan Developer Options")
            }
        }
    }
}