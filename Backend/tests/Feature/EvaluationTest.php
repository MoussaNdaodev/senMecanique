<?php

namespace Tests\Feature;

use Tests\TestCase;
use App\Models\User;
use App\Models\Evaluation;
use Illuminate\Foundation\Testing\RefreshDatabase;

class EvaluationTest extends TestCase
{
    use  RefreshDatabase;

    protected string $endpoint = '/api/evaluations';
    protected string $tableName = 'evaluations';

    public function setUp(): void
    {
        parent::setUp();
    }

    public function testCreateEvaluation(): void
    {
        $this->markTestIncomplete('This test case needs review.');

        $this->actingAs(User::factory()->create());

        $payload = Evaluation::factory()->make([])->toArray();

        $this->json('POST', $this->endpoint, $payload)
             ->assertStatus(201)
             ->assertSee($payload['name']);

        $this->assertDatabaseHas($this->tableName, ['id' => 1]);
    }

    public function testViewAllEvaluationsSuccessfully(): void
    {
        $this->markTestIncomplete('This test case needs review.');

        $this->actingAs(User::factory()->create());

        Evaluation::factory(5)->create();

        $this->json('GET', $this->endpoint)
             ->assertStatus(200)
             ->assertJsonCount(5, 'data')
             ->assertSee(Evaluation::find(rand(1, 5))->name);
    }

    public function testViewAllEvaluationsByFooFilter(): void
    {
        $this->markTestIncomplete('This test case needs review.');

        $this->actingAs(User::factory()->create());

        Evaluation::factory(5)->create();

        $this->json('GET', $this->endpoint.'?foo=1')
             ->assertStatus(200)
             ->assertSee('foo')
             ->assertDontSee('foo');
    }

    public function testsCreateEvaluationValidation(): void
    {
        $this->markTestIncomplete('This test case needs review.');

        $this->actingAs(User::factory()->create());

        $data = [
        ];

        $this->json('post', $this->endpoint, $data)
             ->assertStatus(422);
    }

    public function testViewEvaluationData(): void
    {
        $this->markTestIncomplete('This test case needs review.');

        $this->actingAs(User::factory()->create());

        Evaluation::factory()->create();

        $this->json('GET', $this->endpoint.'/1')
             ->assertSee(Evaluation::first()->name)
             ->assertStatus(200);
    }

    public function testUpdateEvaluation(): void
    {
        $this->markTestIncomplete('This test case needs review.');

        $this->actingAs(User::factory()->create());

        Evaluation::factory()->create();

        $payload = [
            'name' => 'Random'
        ];

        $this->json('PUT', $this->endpoint.'/1', $payload)
             ->assertStatus(200)
             ->assertSee($payload['name']);
    }

    public function testDeleteEvaluation(): void
    {
        $this->markTestIncomplete('This test case needs review.');

        $this->actingAs(User::factory()->create());

        Evaluation::factory()->create();

        $this->json('DELETE', $this->endpoint.'/1')
             ->assertStatus(204);

        $this->assertEquals(0, Evaluation::count());
    }
    
}
